class c_184_1;
    int i = 183;
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

program p_184_1;
    c_184_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xz00000zxz01xz0zz1101x011xzz00z0zxxzzxzxxxzxzzzzxxxxzxzzzzzzzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
