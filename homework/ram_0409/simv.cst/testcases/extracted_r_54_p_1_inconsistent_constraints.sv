class c_54_1;
    int i = 53;
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

program p_54_1;
    c_54_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0x100z0x00xx0xxxzx01xx11zx11x001zxzxxxzxxxxxxxxxzzzxxxxxzzxzzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
