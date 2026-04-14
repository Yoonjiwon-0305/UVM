class c_86_1;
    int i = 85;
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

program p_86_1;
    c_86_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0x1z00z1x010zzz0zzzz1001x00001x0zzzxxxzzxzxxzxxzxxzxzzxxxzxzxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
