class c_27_1;
    int i = 26;
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

program p_27_1;
    c_27_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zz0zz1xz111z1z1011xz0001zx0zx001zxxzzzxxzzxzzxxzzxxxxxzzzzxzxxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
