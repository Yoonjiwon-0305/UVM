class c_149_1;
    int i = 148;
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

program p_149_1;
    c_149_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xxzx0xz1zxx010z1xz1z1xx0xz1z10zzxzxzzxzzxzxzzzzzxzzzxxxzzzzzxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
