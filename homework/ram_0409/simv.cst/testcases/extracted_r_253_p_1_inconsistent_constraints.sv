class c_253_1;
    int i = 252;
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

program p_253_1;
    c_253_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x01xz01x1x11x0001zx0zx1zx11zz1x1zxxxzxxzzzzxxzzxxzxzxxxzzzxzxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
