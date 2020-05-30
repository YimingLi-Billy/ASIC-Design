// $Id: $
// File name:   rcu.sv
// Created:     11/11/2019
// Author:      David Evans
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Receiver Control Unit for USB Receiver
module rcu(input wire clk,
           input wire n_rst,    
           input wire d_edge,
           input wire byte_complete,
           input wire eop,
           output reg crc_check_5,
           output reg crc_check_16,
           input wire [1:0] sync_status,
           input wire [2:0] pid_status,
           input wire [1:0] crc_status,
           output reg enable_timer,
           output reg check_pid,
           output reg check_sync,
           output reg load_sync,
           output reg load_pid,
           output reg load_data,
           output reg load_error,
           output reg load_done);

typedef enum bit [4:0] {IDLE, RECEIVE, SYNC, CHECK_SYNC, PID, CHECK_PID, DATAINOUT, DATA01, CHECK5, CHECK16, EOP, ERROR, DONE} stateType;
stateType state;
stateType next_state;

reg store_eop = 1'b0;
reg nxt_store_eop;

always_ff @(posedge clk, negedge n_rst) begin
  if(n_rst == 1'b0) begin
    state <= IDLE;
    store_eop <= 1'b0;
  end
  else begin
    state <= next_state;
    store_eop <= nxt_store_eop;
  end
end

always_comb // general process of this Control Unit: 2 steps for each sequence (whether that's a byte or collection of bytes). getting the data: ruled by a byte_complete input and outputs a load for the data_buffer
            //                                                                                                                 checking the data: a check_<signal> is sent to the buffer and it returns a signal based on the result. 
            //                                                                                                                 at any point a check can send the rcu to error, but if it doesn't the sequence continues.
begin : NEXT_STATE_LOGIC
  next_state = state;
  case(state) 
    IDLE:
    begin
      if(d_edge) begin
         next_state = RECEIVE;
      end
      else begin
         next_state = IDLE;
      end
    end
    RECEIVE:
    begin
      next_state = SYNC;
    end
    SYNC:
    begin
     if(byte_complete) begin
       next_state = CHECK_SYNC;
     end
     else begin
       next_state = SYNC;
     end
    end
    CHECK_SYNC:
    begin
      if(sync_status == 2'b0) begin
         next_state = CHECK_SYNC;
      end
      else if(sync_status == 2'b01) begin
         next_state = PID;
      end
      else begin
         next_state = ERROR;
      end
    end
    PID: 
    begin
     if(byte_complete) begin
        next_state = CHECK_PID;
     end
     else begin
        next_state = PID;
     end
    end
    CHECK_PID:
    begin
      if(pid_status == 3'b000) begin
        next_state = CHECK_PID;
      end
      else if(pid_status == 3'b001) begin
        next_state = DATAINOUT;
      end
      else if(pid_status == 3'b010) begin
        next_state = DATA01;
      end
      else if(pid_status == 3'b011) begin
        next_state = EOP;
      end
      else begin
       next_state = ERROR;
      end
    end
    DATAINOUT:
    begin
       if(eop != 1'b1) begin
          next_state = DATAINOUT;
       end
       else begin
          next_state = CHECK5;
       end
    end
    DATA01:
    begin
       if(eop != 1'b1) begin
         next_state = DATA01;
       end
       else begin
         next_state = CHECK16;
       end
    end
    CHECK5:
    begin 
      if(crc_status == 2'b10) begin
        next_state = ERROR;
      end
      else if(crc_status == 2'b01) begin
        next_state = DONE;
      end
      else begin
        next_state = CHECK5;
      end
    end
    CHECK16:
    begin 
      if(crc_status == 2'b10) begin
        next_state = ERROR;
      end
      else if(crc_status == 2'b01) begin
        next_state = DONE;
      end
      else begin
        next_state = CHECK16;
      end
    end
    EOP:
    begin
      if(store_eop) begin
        next_state = DONE;
      end
      else begin
        next_state = EOP;
      end
    end
    ERROR:
    begin
      next_state = DONE;
    end
    DONE:
    begin
      next_state = IDLE;
    end
  endcase
end

always_comb 
begin : OUTPUT_LOGIC
  if(state == RECEIVE) begin
    enable_timer = 1'b1;
  end
  else if((state == CHECK5) || (state == CHECK16) || (state == DONE) || (state == IDLE) || (state == ERROR)) begin
    enable_timer = 1'b0;
  end
  else begin
    enable_timer = 1'b1;
  end
  if(state == SYNC) begin
    load_sync = 1'b1;
  end
  else begin
    load_sync = 1'b0;
  end
  if(state == CHECK_SYNC) begin
    check_sync = 1'b1;
  end
  else begin
    check_sync = 1'b1;
  end
  if(state == PID) begin
    load_pid = 1'b1;
  end
  else begin
    load_pid = 1'b0;
  end
  if(state == CHECK_PID) begin
    check_pid = 1'b1;
  end
  else begin
    check_pid = 1'b0;
  end
  if((state == DATA01) || (state == DATAINOUT)) begin
    load_data = 1'b1;
  end
  else begin
    load_data = 1'b0;
  end
  if(state == ERROR) begin
    load_error = 1'b1;
  end
  else begin
    load_error = 1'b0;
  end
  if(state == DONE) begin
    load_done = 1'b1;
  end
  else begin
    load_done = 1'b0;
  end 
end

always_comb 
begin
   nxt_store_eop = store_eop;
   if(eop == 1'b1) begin
      nxt_store_eop = 1'b1;
   end
   else if(state == IDLE) begin
     nxt_store_eop = 1'b0;
   end
end

endmodule
