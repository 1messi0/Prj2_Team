<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>ChatBot</title>
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<!-- Simple line icons-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css" rel="stylesheet" />
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/css/main.css" />
<link href="css/styles.css" rel="stylesheet" />
<link href="css/chatbot.css" rel="stylesheet" />
    <link href="/webjars/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/sockjs-client/sockjs.min.js"></script>
    <script src="/webjars/stomp-websocket/stomp.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="/app.js" charset="UTF-8"></script>
<style> 
  /* page-loading */
    #loading {
      width: 100%;
      height: 100%;
      top: 0;
      left: 0;
      position: fixed;
      display: block;
      opacity: 0.6;
      background: #e4e4e4;
      z-index: 99;
      text-align: center;
    }

    #loading>img {
      position: absolute;
      top: 40%;
      left: 45%;
      z-index: 100;
    }

    #loading>p {
      position: absolute;
      top: 57%;
      left: 43%;
      z-index: 101;
    }
    body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 20px;
}

#chat-container {
    width: 300px;
    height: 1000px; 
    margin: 0 auto;
}

#chat-box {
    height: 500px; /* 최대 높이 설정 */
    width: 500px;
    border: 1px solid #ddd;
    padding: 10px;
    background-color: #fff;
    margin-bottom: 10px;
}

#result pre {
    margin: 0;
    white-space: pre-wrap; /* 긴 문장을 줄 바꿈 처리 */
}

form {
    display: flex;
    margin-top: 10px;
}

input[type="text"] {
    flex: 1;
    padding: 8px;
}

input[type="button"] {
    padding: 8px 15px;
    background-color: #4caf50;
    color: #fff;
    border: none;
    cursor: pointer;
}

#loading {
    display: none;
    color: #888;
}

  .message {
        margin-bottom: 10px;
        clear: both;
        overflow: hidden;
    }

    .user-message {
        float: right;
        background-color: #4caf50;
        color: white;
        border-radius: 15px;
        padding: 10px;
    }

    .bot-message {
        float: left;
        background-color: #ddd;
        border-radius: 15px;
        padding: 10px;
    }
</style>

</head>
<body>
   <div id="chat-container">
           <h2>플로리츠 챗봇</h2>
    <div id="chat-box">
        <div id="result"></div>
    </div>
    <form action="/send" method="post" onsubmit="return false;">
        <input type="text" id="keywords" onkeydown="handleKeyDown(event)" />
        <input type="button" value="전송" onclick="chatGPT()" />
    </form>
    <div id="loading">로딩 중...</div>
</div>
 <script>
    $(document).ready(function () {
        $('#loading').hide();
    });

    function chatGPT() {
        const api_key = "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";
        const keywords = document.getElementById('keywords').value;
        $('#loading').show();

        const messages = [
            { role: 'system', content: 'You are a helpful assistant.' },
            { role: 'user', content: keywords }, // 키워드 추가
        ]

        const data = {
            model: 'gpt-3.5-turbo',
            temperature: 0.5,
            n: 1,
            messages: messages,
        }

        $.ajax({
            url: "https://api.openai.com/v1/chat/completions",
            method: 'POST',
            headers: {
                Authorization: "Bearer " + api_key,
                'Content-Type': 'application/json',
            },
            data: JSON.stringify(data),
        }).then(function (response) {
            $('#loading').hide();
            console.log(response);
            let result = document.getElementById('result');
            
            // 사용자의 입력 메시지를 오른쪽에 표시
            let userMessage = document.createElement('div');
            userMessage.className = 'message user-message';
            userMessage.innerHTML = keywords;
            result.appendChild(userMessage);

            let pre = document.createElement('pre');
            pre.innerHTML = "\n\n" + response.choices[0].message.content;

            // 채팅박스에 챗봇의 응답 메시지 추가
            let botMessage = document.createElement('div');
            botMessage.className = 'message bot-message';
            botMessage.appendChild(pre);
            result.appendChild(botMessage);

            // 자동으로 스크롤을 아래로 이동
            result.scrollTop = result.scrollHeight;

            document.getElementById('keywords').value = '';
        });
    }

    function handleKeyDown(event) {
        if (event.key === "Enter") {
            event.preventDefault();
            chatGPT();
        }
    }
</script>
</body>
</html>

     