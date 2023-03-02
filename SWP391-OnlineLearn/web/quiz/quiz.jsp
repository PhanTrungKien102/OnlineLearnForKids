<%-- 
    Document   : quiz
    Created on : Feb 17, 2023, 12:27:16 AM
    Author     : Acer
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quiz</title>
        <link rel="stylesheet" href="../Assets/css/Style.css">
        <link rel="stylesheet" href="../quiz/css/quiz.css"/>
        <!-- link bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!--nav bar-->
        <jsp:include page="../custom/nav.jsp"></jsp:include>
            <!-- FontAweome CDN Link for Icons-->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
            <style>
                .nav-bar{margin: 1em auto}
            </style>
        </head>

        <body style="background-image: url(../Assets/images/bg.png)">
            <!-- start Quiz button -->
            <div class="start_btn"><button>Nhấn để bắt đầu</button></div>

            <!-- Info Box -->
            <div class="info_box">
                <div class="info-title"><span>Nhắn nhủ</span></div>
                <div class="info-list">
                    <div class="info">Bạn có <span>30 s</span> để trả lời một câu hỏi.</div>
                    <div class="info">Khi bạn đã chọn câu hỏi không thể chọn lại.</div>
                    <div class="info">Đã sẵn sàng ? Nhấn tiếp tục để làm bài.</div>

                </div>
                <div class="buttons">
                    <button class="quit">Thoát</button>
                    <button class="restart">Tiếp tục</button>
                </div>
            </div>

            <!-- Quiz Box -->
            <div class="quiz_box">
                <header>
                    <div class="title">Hỏi nhanh đáp gọn</div>
                    <div class="timer">
                        <div class="time_left_txt">Time Left</div>
                        <div class="timer_sec">30</div>
                    </div>
                    <div class="time_line"></div>
                </header>
                <section>
                    <div class="que_text">
                        <!-- Here  inserted question from JavaScript -->
                    </div>
                    <div class="option_list">
                        <!-- Here inserted options from JavaScript -->
                    </div>
                </section>

                <!-- footer of Quiz Box -->
                <footer>
                    <div class="total_que">
                        <!-- Here inserted Question Count Number from JavaScript -->
                    </div>
                    <button class="next_btn">Next</button>
                </footer>
            </div>

            <!-- Result Box -->
            <div class="result_box">
                <div class="icon">
                    <i class="fas fa-crown"></i>
                </div>
                <div class="complete_text"> Hoàn thành!!!</div>
                <div class="score_text">
                    <!-- Here inserted Score Result from JavaScript -->
                </div>
                <div class="buttons">
                    <button class="restart">Làm lại</button>
                    <button class="quit">Thoát</button>
                </div>
            </div>


            <script>
<!-- Database -->
    let questions = [
            <c:forEach items="${requestScope.questionBank}" var="qu">

    {
                numb:${qu.index},
                question: "${qu.question}",
                answer: "${qu.true_answer}",
                options: [
                        "${qu.option1}",
                        "${qu.option2}",
                        "${qu.option3}",
                        "${qu.option4}"
                ]
    },

            </c:forEach>

                ];  



   const start_btn = document.querySelector(".start_btn button");
    const info_box = document.querySelector(".info_box");
    const exit_btn = info_box.querySelector(".buttons .quit");
          const continue_btn = info_box.querySelector(".buttons .restart");
          const quiz_box = document.querySelector(".quiz_box");
    const result_box = document.querySelector(".result_box");
    const option_list = document.querySelector(".option_list");
    const time_line = document.querySelector("header .time_line");
    const timeText = document.querySelector(".timer .time_left_txt");
                    const timeCount = document.querySelector(".timer .timer_sec");
    
    
    start_btn.onclick = ()=>{
                info_box.classList.add("activeInfo");
    };
    
    // if exitQuiz button clicked
        exit_btn.onclick = ()=>{
                info_box.classList.remove("activeInfo");
            };
            
            
            continue_btn.onclick = ()=>{
                info_box.classList.remove("activeInfo");
        quiz_box.classList.add("activeQuiz");
        showQuetions(0);
        queCounter(1);
        startTimer(30);
        startTimerLine(0);
            };
            
            let timeValue =  30;
            let que_count = 0;
        let que_numb = 1;
    let userScore = 0;
    let counter;
    let counterLine;
            let widthValue = 0;
            
            const restart_quiz = result_box.querySelector(".buttons .restart");
                const quit_quiz = result_box.querySelector(".buttons .quit");
            
            // if restartQuiz button clicked
        restart_quiz.onclick = ()=>{
                quiz_box.classList.add("activeQuiz");
        result_box.classList.remove("activeResult");
        timeValue = 30;
        que_count = 0;
        que_numb = 1;
        userScore = 0;
        widthValue = 0;
        showQuetions(que_count);
        queCounter(que_numb);
        clearInterval(counter);
        clearInterval(counterLine);
        startTimer(timeValue);
        startTimerLine(widthValue);
        timeText.textContent = "Time Left";
        next_btn.classList.remove("show");
    };
    
    
    quit_quiz.onclick = ()=>{
                window.location.reload();
        };
            
            const next_btn = document.querySelector("footer .next_btn");
        const bottom_ques_counter = document.querySelector("footer .total_que");
            
            // if Next Que button clicked
        next_btn.onclick = ()=>{
                if (que_count < questions.length - 1){
        que_count++;
        que_numb++;
        showQuetions(que_count);
        queCounter(que_numb);
        clearInterval(counter);
        clearInterval(counterLine);
        startTimer(timeValue);
        startTimerLine(widthValue);
        timeText.textContent = "Time Left";
        next_btn.classList.remove("show");
        } else{
        clearInterval(counter);
        clearInterval(counterLine);
        showResult();
        }
                        };
                        
                        // getting questions and options from array
    function showQuetions(index){
                const que_text = document.querySelector(".que_text");
        let que_tag = '<span>' + questions[index].numb + ". " + questions[index].question + '</span>';
        let option_tag = '<div class="option"><span>' + questions[index].options[0] + '</span></div>'
                + '<div class="option"><span>' + questions[index].options[1] + '</span></div>'
                + '<div class="option"><span>' + questions[index].options[2] + '</span></div>'
                + '<div class="option"><span>' + questions[index].options[3] + '</span></div>';
        que_text.innerHTML = que_tag;
        option_list.innerHTML = option_tag;
        const option = option_list.querySelectorAll(".option");
        for (i = 0; i < option.length; i++){
        option[i].setAttribute("onclick", "optionSelected(this)");
        }
                }
                
                let tickIconTag = '<div class="icon tick"><i class="fas fa-check"></i></div>';
                let crossIconTag = '<div class="icon cross"><i class="fas fa-times"></i></div>';
        
        
        function optionSelected(answer){
                clearInterval(counter);
        clearInterval(counterLine);
        let userAns = answer.textContent;
        let correcAns = questions[que_count].answer;
        const allOptions = option_list.children.length;
        if (userAns == correcAns){
        userScore += 1;
        answer.classList.add("correct");
        answer.insertAdjacentHTML("beforeend", tickIconTag);
        console.log("Correct Answer");
        console.log("Your correct answers = " + userScore);
        } else{
        answer.classList.add("incorrect");
        answer.insertAdjacentHTML("beforeend", crossIconTag);
        console.log("Wrong Answer");
        for (i = 0; i < allOptions; i++){
        if (option_list.children[i].textContent == correcAns){
        option_list.children[i].setAttribute("class", "option correct");
        option_list.children[i].insertAdjacentHTML("beforeend", tickIconTag);
        }
        }
        }
        for (i = 0; i < allOptions; i++){
        option_list.children[i].classList.add("disabled");
        }
        next_btn.classList.add("show");
                }
                
        function showResult(){
                info_box.classList.remove("activeInfo");
        quiz_box.classList.remove("activeQuiz");
        result_box.classList.add("activeResult");
        const scoreText = result_box.querySelector(".score_text");
        if (userScore > 3){
        let scoreTag = '<span> 🎉, Bạn làm đúng <p>' + userScore + '</p> trong <p>' + questions.length + '</p></span>';
        scoreText.innerHTML = scoreTag;
        }
        else if (userScore > 1){
        let scoreTag = '<span> 😎 Bạn làm đúng <p>' + userScore + '</p> trong <p>' + questions.length + '</p></span>';
        scoreText.innerHTML = scoreTag;
        }
        else{
        let scoreTag = '<span> 😐 Bạn làm đúng <p>' + userScore + '</p> trong <p>' + questions.length + '</p></span>';
        scoreText.innerHTML = scoreTag;
        }
                        }
                        
    function startTimer(time){
                counter = setInterval(timer, 1000);
        function timer(){
        timeCount.textContent = time;
        time--;
        if (time < 9){
        let addZero = timeCount.textContent;
        timeCount.textContent = "0" + addZero;
        }
        if (time < 0){
        clearInterval(counter);
        timeText.textContent = "Time Off";
        const allOptions = option_list.children.length;
        let correcAns = questions[que_count].answer;
        for (i = 0; i < allOptions; i++){
        if (option_list.children[i].textContent == correcAns){
        option_list.children[i].setAttribute("class", "option correct");
        option_list.children[i].insertAdjacentHTML("beforeend", tickIconTag);
        console.log("Time Off: Auto selected correct answer.");
        }
        }
        for (i = 0; i < allOptions; i++){
        option_list.children[i].classList.add("disabled");
        }
        next_btn.classList.add("show");
        }
        }
                }
                
                function startTimerLine(time){
                counterLine = setInterval(timer, 59);
        function timer(){
        time += 1;
        time_line.style.width = time + "px";
        if (time > 549){
        clearInterval(counterLine);
        }
        }
        }
        
        function queCounter(index){

                let totalQueCounTag = '<span><p>' + index + '</p> of <p>' + questions.length + '</p> Questions</span>';
        bottom_ques_counter.innerHTML = totalQueCounTag;  
            }
        
  </script>

    

</body>
</html>