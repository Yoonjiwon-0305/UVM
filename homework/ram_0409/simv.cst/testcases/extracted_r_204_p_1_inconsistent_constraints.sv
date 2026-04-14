class c_204_1;
    int i = 203;
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

program p_204_1;
    c_204_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xz1x010zx0z00xx10zzx10xx0x0xz001zzzzzzzxxxzxzxzzxxxzxzzxxxxzzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
