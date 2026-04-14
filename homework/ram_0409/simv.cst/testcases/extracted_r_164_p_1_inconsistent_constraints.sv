class c_164_1;
    int i = 163;
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

program p_164_1;
    c_164_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1xzx10x0z0z0010xx0zxx00xzxz101xxzzxxzzxxzzzzxxzxxxzxzzzxzxzxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
