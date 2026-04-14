class c_45_1;
    int i = 44;
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

program p_45_1;
    c_45_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x0z0z1z0x010010xxz1z1001xx10zxz0xzzxzxzzxxxzxzxzzzzzzxxzxzxzxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
