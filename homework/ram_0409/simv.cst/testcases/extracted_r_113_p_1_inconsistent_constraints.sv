class c_113_1;
    int i = 112;
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

program p_113_1;
    c_113_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z00zz111zxz01100z1xxxzzx0z0zz0z0xzxzxzxzxzzxxzzzzxzzzzxxzzzxxxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
