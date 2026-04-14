class c_46_1;
    int i = 45;
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

program p_46_1;
    c_46_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1001zxx10z01xzx0z1x00z0xz0xz1x0zxxxxzzxzxzzzzxzzzxzxzzxxxzzzzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
