class c_82_1;
    int i = 81;
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

program p_82_1;
    c_82_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xzzz1x11z1x10x10zxx0xxxz101x11xxzxzxxxxzzxxzxzxxxzzxxzzzxxzzzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
