class c_207_1;
    int i = 206;
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

program p_207_1;
    c_207_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zzzzxz01100001110zz0z11x100xz01zzxxzxzxxzzzxxzxxxzxxxzzzzzzxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
