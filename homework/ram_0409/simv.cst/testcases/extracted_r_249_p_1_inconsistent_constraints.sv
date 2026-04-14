class c_249_1;
    int i = 248;
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

program p_249_1;
    c_249_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zz10x1x11xz0z0x110zz100100000zxzzxxzxxxzzxzzxzzxxxxxxzzxzxzzzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
