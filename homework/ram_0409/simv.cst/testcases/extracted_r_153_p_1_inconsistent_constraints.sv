class c_153_1;
    int i = 152;
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

program p_153_1;
    c_153_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xxzxzzzz1x10xx1xzz0x0z1x1zz0xx00zxxxzzzxxzxzxxxzxzzxxxzzxxzxxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
