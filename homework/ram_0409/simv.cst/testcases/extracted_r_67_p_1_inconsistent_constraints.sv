class c_67_1;
    int i = 66;
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

program p_67_1;
    c_67_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "111x0xz1z1zx0x1z1zx0z0zx0z001110xzzzxzzxzxxxzzxxxzxxxxxzzxzzxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
