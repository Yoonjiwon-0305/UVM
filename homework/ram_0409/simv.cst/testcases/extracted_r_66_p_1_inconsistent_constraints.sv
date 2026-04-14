class c_66_1;
    int i = 65;
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

program p_66_1;
    c_66_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1xxz1zz1x0z01xz1xz1xzz00xz0zxx1xxxxxxxzxzzzxzxzzxxxxxxzzzzzxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
