class c_20_1;
    int i = 19;
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

program p_20_1;
    c_20_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0110x1z0xx111x10x0x00z00zz00z1x0zzzzzzxzzxzzzxxzxzzxxxzzxzzzxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
