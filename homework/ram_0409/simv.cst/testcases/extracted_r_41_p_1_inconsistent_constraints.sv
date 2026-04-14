class c_41_1;
    int i = 40;
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

program p_41_1;
    c_41_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1zz1100100zxzx1x0xxzx1xzz11zzx01zxxxzzxxzxxxzxxxxxxxxzzzxzxzzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
