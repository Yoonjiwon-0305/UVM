class c_23_1;
    int i = 22;
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

program p_23_1;
    c_23_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1zz0zx10xxx11xz1x00zx00x1x1z0xz0zzzzxzzzzxzzzzzxzzxxzzzzzxzxzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
