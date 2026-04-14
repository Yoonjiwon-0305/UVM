class c_72_1;
    int i = 71;
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

program p_72_1;
    c_72_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1z0xzxxx1zxz01xzx0z1110z0z0010z0xxzzzzxzzxzzzxzxxzzxxzxzzzzzzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
