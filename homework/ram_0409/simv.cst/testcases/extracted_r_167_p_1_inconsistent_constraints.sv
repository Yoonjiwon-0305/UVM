class c_167_1;
    int i = 166;
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

program p_167_1;
    c_167_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "00xx0z101z01zzzz0z111zz10011z1zxxxxxxxxzzzzxzxzxzzzxzzzzzzzzzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
