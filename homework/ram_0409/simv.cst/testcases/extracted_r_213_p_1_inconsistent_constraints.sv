class c_213_1;
    int i = 212;
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

program p_213_1;
    c_213_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0x0xx00xxxz00zz1xz010z00xxxx1zxzzxxzxzxxxxzxzxzxzzzzzxzzxzzzxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
