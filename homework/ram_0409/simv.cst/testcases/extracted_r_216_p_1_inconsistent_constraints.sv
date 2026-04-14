class c_216_1;
    int i = 215;
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

program p_216_1;
    c_216_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1z0x1xx100z0zx00z101zxx0zx1zzx0xxxxzxxzxzzzxzzxxzxzzxzxxxzzxzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
