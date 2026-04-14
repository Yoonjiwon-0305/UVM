class c_199_1;
    int i = 198;
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

program p_199_1;
    c_199_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1x1xxzx0z0x0x10x101x01zx0001x10xzzxxxzzxzxzzxxxzxzzzxxzzzzxxxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
