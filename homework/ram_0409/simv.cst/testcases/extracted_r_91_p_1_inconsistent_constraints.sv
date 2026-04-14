class c_91_1;
    int i = 90;
    rand bit[7:0] addr; // rand_mode = ON 

    constraint r_addr_this    // (constraint_mode = ON) (./tb/ram_seq_item.sv:14)
    {
       (addr inside {[8'h0:8'hf]});
    }
    constraint WITH_CONSTRAINT_this    // (constraint_mode = ON) (./tb/ram_sequence.sv:102)
    {
       (addr == i);
    }
endclass

program p_91_1;
    c_91_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1x110z10zz1x0z011x1000zz111xzz0xxzzxxzzzxzzxxzzxxxzzzzzzxzzzxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
