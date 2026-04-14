class c_50_1;
    int i = 49;
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

program p_50_1;
    c_50_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zz0zx00x0xzx0z1z00zxx00zzx1xx111xzzxzxzzzzzzzzzzzxzzxxxzxzzzxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
