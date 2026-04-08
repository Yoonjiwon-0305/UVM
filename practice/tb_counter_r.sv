`include "uvm_macros_svh"
import uvm_pkg::*;

interface counter_if (
    input logic clk
);
    logic       reset_n;
    logic       enable;
    logic [3:0] count;

endinterface

class counter_seq_item extends uvm_sequence_item; // UVM 에사 만들어 놓은 트랜잭션 베이스 클래스
    rand bit       reset_n;  // Driver가 DUT에 인가할 값
    rand bit       enable;  // Driver가 DUT에 인가할 값
    rand bit       cycles;  // Driver가 몇 클럭 유지할지
    logic    [3:0] count;  // Monitor 가 DUT에서 읽어올 값

    //rand bit : Sequence 가 randomize()로 값을 채워서 Driver에 전달
    //logic : Mointor 가 DUT 출력을 읽어서 채움

    // constrain - 범위제한 
    // cycle을 1~20까지만
    constraint c_cycles {cycles inside {[1 : 20]};}

    //`uvm_object_utils매크로 
    //=> UVM Factory 에 등록 -> type_id:;creat로 생성 가능하게 됌
    //=> 자동매서드 생성 : copy,compare,print,pack/unpack
    //<UVM_ALL_ON = 아래 기능 전부 활성화>
    //UVM_COPY      →  item.copy(other_item)
    //UVM_COMPARE   →  item.compare(other_item)
    //UVM_PRINT     →  item.print()
    //UVM_RECORD    →  파형 기록
    //UVM_PACK      →  비트 직렬화
    `uvm_object_utils_begin(counter_seq_item)
        `uvm_field_int(reset_n, UVM_ALL_ON)
        `uvm_field_int(enable, UVM_ALL_ON)
        `uvm_field_int(cycles, UVM_ALL_ON)
        `uvm_field_int(count, UVM_ALL_ON)
    `uvm_object_utils_end

    // UVM 객체는 반드시 이름(name) 을 가져야함
    // super.new(name) -> 부모 클래스 uvm_sequence_item 의 생성자 호출
    // 이름 등록, 내부 초기화 담당
    function new(string name = "counter_seq_item");
        super.new(name);
    endfunction

    //conver2string : item의 현재 값을 문자열로 출력하기 위해
    function string conver2string();
        return $sformatf(
            "reset_n=%0b enable=%0b cycle=%0d count=%0h",
            reset_n,
            enable,
            cycles,
            count
        );

    endfunction

endclass  //counter_seq_item extends superClass

// 총 3개의 sequence 존재
// 3개로 나누는 이유? 작을 블록(reset,count)을 만들고 필요한 순서대로 조림(master)
// 1st : reset_seq
//uvm_sequence : uvm 베이스 클래스 ,#(counter_seq_item) => 어떤 item 을 쓸지  
// #(counter_seq_item) = "나는 counter_seq_item을 다루는 Sequence야"

// DUT(counter)를 안정적인 초기 상태로 만들기
class counter_reset_seq extends unm_sequence #(counter_seq_item);
    `uvm_object_utils(counter_reset_seq)  // factor에 등록

    function new(string name = "counter_reset_seq");
        super.new(name);  // 안하면 UVM내부 동작 보장 안됌
    endfunction

    //virtual 자식 클래스에서 오버라이딩 가능
    // function이 아니라 task인 이유? start_item,finish_item 이 시간을 소비함 
    // 시간을 소비하는 코드는 반드시 task로 선언
    //body() => sequence 실행시 자동으로 호출되는 메서드    
    virtual task body();
        counter_seq_item item;
        item = counter_seq_item::type_id::create(
            "item");  //→ Factory를 통해 실제 객체 생성

        //1. Sequencer에게 "item 보낼 준비됐어" 신호
        //2. Driver가 준비될 때까지 여기서 대기
        //→ Driver가 get_next_item() 호출할 때까지 블로킹
        //3. item의 우선순위 설정
        start_item(item);
        item.reset_n = 0;
        item.enable  = 0;
        item.cycle   = 2;  //리셋 안정화를 위해 2클럭 보장

        //1. Sequencer에게 "item 다 채웠어, Driver에 전달해줘"
        //2. Driver가 drive_item() 완료할 때까지 여기서 대기
        //   → Driver가 item_done() 호출할 때까지 블로킹
        finish_item(item);

        //로그 출력
        `uvm_info(get_type_name(), "Reset Done!", UVM_MEDIUM)
    endtask  //
endclass

// 카운트 시나리오 (랜덤값)
class counter_count_seq extends uvm_sequence #(counter_seq_item);
    `uvm_object_utils(counter_count_seq);
    //Factory에 counter_count_seq 등록
    //→ type_id::create() 로 생성 가능

    int num_transactions;
    //→ 몇 번 반복할지 저장하는 변수


    //→ 멤버변수 초기화
    //→ 기본값 0으로 설정
    //→ 외부에서 설정 안하면 body()의 for문이 0번 실행
    //→ 실수로 설정 안했을 때 아무것도 안하고 끝남
    function new(string name = "counter_count_seq");
        super.new(name);
        num_transactions = 0;
    endfunction


    //num_transactions 만큼 반복 전송
    virtual task body();
        counter_seq_item item;
        for (int i = 0; i < num_transactions; i++) begin
            item = counter_seq_item::type_id::create($sformatf("item_%0d", i));

            start_item(item);  //Driver 준비될 때까지 대기
            if (!item.randomize() with {
                    reset_n == 1;  // 고정 1
                    enable == 1;  // 고정 1
                    cycles inside {[1 : 5]};  // 1부터 5까지 숫자만 
                })
                `uvm_fatal(get_type_name(), "Randomaization failed!")
            finish_item(
                item);  //Driver가 drive_item() 완료할 때까지 대기

            `uvm_info(
                get_type_name() $sformatf("[%0d/%0d] %s",i+1,num_transactions,item.conver2string()),
                UVM_HIGH)
        end
    endtask
endclass

// master_seq는 순소 조율만 하지 실제로 값을 생성하는 곳은 아니다
class counter_master_seq extends uvm_sequence #(counter_seq_item);
    `uvm_object_utils(counter_master_seq)
    //동일하게 Factory에 등록
    //→ type_id::create() 로 생성 가능    

    //→ num_transactions 같은 멤버변수 없음
    //→ 왜냐하면 master_seq는 직접 item을 다루지 않음
    //→ 하위 seq들이 각자 알아서 처리
    function new(string name = "counter_master_seq");
        super.new(name);
    endfunction  //new()

    // master는 다른 seq를 실행만 하고 item 직접 만지지 않는다.
    virtual task body();
        counter_reset_seq reset_seq;
        counter_count_seq count_seq;

        `uvm_info(get_type_name(), "===== Phase 1: Reset =====", UVM_MEDIUM)
        //Factory를 통해 실제 객체 생성
        reset_seq = counter_reset_seq::type_id::create("reset_seq");
        reset_seq.start(m_sequencer);
        //m_sequence : uvm_sequence 내장 변수 ("나를 실행 시킨 Sequence 누구?")
        // .start : sequence의 body()를 실행시키는 메서드
        // body() 시작부터 끝까지 실행하고 반환
        // 내부적으로 이미 시작과 끝이 포함된다

        `uvm_info(get_type_name(), "===== Phase 2: Count =====", UVM_MEDIUM)
        //Factory를 통해 실제 객체 생성
        count_seq = counter_count_seq::type_id::create("count_seq");
        count_seq.num_transactions = 5;  //master_seq에서는 5번으로 고정
        count_seq.start(m_sequencer);

        `uvm_info(get_type_name(), "===== Master Sequence done =====",
                  UVM_MEDIUM)
    endtask
endclass

class counter_driver extends uvm_driver #(counter_seq_item);
    //#(counter_seq_item) = "나는 counter_seq_item을 받아서 처리할거야"
    //uvm_driver가 제공하는 것
    //    → seq_item_port  : Sequencer와 통신하는 포트 (내장)
    //    → get_next_item(): Sequencer에게 item 요청
    //    → item_done()    : Sequencer에게 처리 완료 알림

    //uvm_object    →  동적으로 생성/소멸 가능
    //                 Sequence처럼 실행할 때만 존재
    //
    //uvm_component →  시뮬레이션 시작부터 끝까지 존재
    //                 Driver, Monitor, Agent처럼
    //                 계층구조에 고정되어 있음
    `uvm_component_utils(counter_driver);

    virtual counter_if c_if;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    //parent 추가된 이유
    //    → Driver는 uvm_component
    //    → Component는 계층구조에 속함
    //    → parent = "나의 부모가 누구야?" 지정
    //    → Agent가 Driver 생성할 때 parent=this 전달

    // build_phase
    virtual function void build_phase(uvm_phase phase);
        //→ 부모 클래스 build_phase 먼저 실행
        //→ 반드시 호출해야 함
        super.build_phase(phase);

        //uvm_config_db#(virtual counter_if)::get()
        //    → config_db에서 Interface 핸들 가져오기
        //
        //config_db::get() 파라미터 분석
        //    (this, "", "c_if", c_if)
        //     ↑     ↑    ↑       ↑
        //     │     │    │       └── 가져온 값을 저장할 변수
        //     │     │    └────────── config_db에 등록된 이름
        //     │     └─────────────── 계층 경로 ("" = 현재위치)
        //     └───────────────────── 누가 요청하는지
        if (!uvm_config_db#(virtual counter_if)::get(this, "", "c_if", c_if))
            `uvm_fatal(get_type_name(), "c_if를 찾을 수 없습니다!")
        `uvm_info(get_type_name(), "build_phase 실행 환료!", UVM_HIGH);
    endfunction

    //drive_item
    virtual task drive_item(counter_seq_item item);
        // 실제로 driver 에서 interface로 값을 전달
        c_if.reset_n <= item.reset_n;
        c_if.enable  <= item.enable;
        repeat (item.cycles) @(posedge c_if.clk);  // 안정성 보장
        `uvm_info(get_type_name(), $sformatf("drive_cycles: %0d", item.cycles),
                  UVM_HIGH);
    endtask

    //run_phase
    virtual task run_phase(uvm_phase phase);
        counter_seq_item item;

        forever begin
            seq_item_port.get_next_item(item);
            drive_item(item);
            seq_item_port.item_done();
        end
    endtask
    //forever begin ... end
    //    → 시뮬레이션 끝날때까지 무한 반복
    //    → 항상 Sequencer의 item을 기다림
    //
    //seq_item_port.get_next_item(item)
    //    → Sequencer에게 "다음 item 줘" 요청
    //    → item이 올 때까지 여기서 블로킹
    //    → item 오면 item 변수에 저장
    //
    //drive_item(item)
    //    → 받은 item을 Interface 핀에 인가
    //    → repeat(cycles) 동안 대기
    //
    //seq_item_port.item_done()
    //    → Sequencer에게 "item 처리 완료" 알림
    //    → 이걸 해야 Sequence의 finish_item()이 반환됨
    //    → 안하면 Sequence가 영원히 대기
    //
    //순서 절대 바꾸면 안됨!
    //    get_next_item()  →  item 받기
    //    drive_item()     →  item 처리
    //    item_done()      →  완료 알림
    //    이 순서 반드시 지켜야 함    

endclass

class counter_monitor extends uvm_monitor;
    `uvm_component_utils(counter_monitor)
    virtual counter_if c_if;
    int expected_count;  // 판단을 위한 비교 변수

    function new(string name, uvm_component parent);
        super.new(name, parent);
        expected_count = 0;
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual counter_if)::get(this, "", "c_if", c_if))
            `uvm_fatal(get_type_name(), "c_if를 찾을 수 없습니다!");
        `uvm_info(get_type_name(), "build_phase 실행 완료!", UVM_HIGH);
    endfunction

    virtual task run_phase(uvm_phase phase);
        `uvm_info(get_type_name(), "run_phase 실행 ", UVM_DEBUG);
        @(posedge c_if.reset_n);

        forever begin
            @(posedge c_if.clk);
            #1;
            if (!c_if.reset_n) begin
                expected_count = 0;
            end else if (c_if.enable) begin
                expected_count = (expected_count + 1) % 16;

                if (c_if.count !== expected_count) begin
                    `uvm_error(get_type_name(),
                               $sformatf("불일치 예상=%0d, 실제=%0d",
                                         expected_count, c_if.count))
                end else begin
                    `uvm_info(get_type_name(), $sformatf(
                              "일치! count=%0d", c_if.count))
                end
            end
        end
    endtask

    virtual function void report_phase(uvm_phase phase);
        super.report_phase(phase);
    endfunction
endclass

class counter_agent extends uvm_agent;
    `uvm_component_utils(counter_agent);
    
    function new();
        
    endfunction //new()
endclass / counter_agent extends uvm_agent
