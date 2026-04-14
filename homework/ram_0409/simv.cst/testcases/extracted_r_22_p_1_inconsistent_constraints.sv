class c_22_1;
    int i = 21;
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

program p_22_1;
    c_22_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xx101zz1z00xzzz0z100zxx001z00xxzzxzzzxzxxxxzxzxzzxxxzxxxxzxxzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
