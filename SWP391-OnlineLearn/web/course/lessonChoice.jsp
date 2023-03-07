<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : lessonChoice
    Created on : Mar 3, 2023, 10:09:42 AM
    Author     : Khangnekk
--%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="../Assets/css/Style.css">
    <link rel="stylesheet" href="../Assets/css/popup.css">
    <link rel="stylesheet" href="../Assets/css/choiceLession.css">
    <!-- link bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
    
</head>

<body>
    <div class="main">
        <div class="nav">
            <div class="nav-bar">
                <ul class="items">
                    <li class="item">
                        <a href="../home/home.html"><img src="../Assets/icon/icon (69).png"></a>
                    </li>
                    <!--                    <li class="item">
                        <a href="../ranking/ranking.html"><img src="../Assets/icon/icon (44).png"></a>
                    </li>-->
                    <li class="item">
                        <a href="../course/classes"><img src="../Assets/icon/icon (71).png"></a>
                    </li>
                    <li class="item">
                        <a href="../payment/CompletePayment.jsp"><img src="../Assets/icon/icon (51).png"></a>
                    </li>
                    <li class="item">
                        <a href="../"><img src="../Assets/icon/icon (45).png"></a>
                    </li>
                    <li class="item avt-btn" style="list-style: none;">
                        <!-- <a href="../"><img src="../Assets/icon/icon (4).png">
                        </a> -->
                        <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown"
                                aria-expanded="false"
                                style="background-color: white; width: 3.2em; height: 3.2em; padding: 0 20px 20px 0; border-radius: 50%; border: 2px solid #ccc;;">
                                <img src="../Assets/icon/icon (4).png">
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="../userprofile/userprofile.html">User profile</a>
                                </li>
                                <li><a class="dropdown-item" href="../login/login.jsp">Logout</a></li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>

            </div>
        </div>

        <div class="content">
            <!--Ae code o day nha-->
            <div class="container text-center choicelession">
                <div class="row row-cols-2 row-cols-lg-5 g-2 g-lg-3 choicelession-content" style="margin-top: 10%; border-bottom: 1em solid white; padding-bottom: 1em;">
                    <div class="col">
                        <a href="./quiz?lession_id=${requestScope.lesson.lesson_id}" style="text-decoration: none; color: white; ">
                            <div class="p-3" style="background-color: #7030a0; height: 20em; width: 12em; border-radius: 15px;">
                                <p style="
                        font-weight: bolder; font-size: 2rem;"> Bài tập</p>
                                <div class="box-border">
                                    <div class="box-content"></div>
                                </div>
                            </div>
                        </a>

                    </div>
                    <div class="col">
                        <a href="../game/matchgame?lession_id=${requestScope.lesson.lesson_id}" style="text-decoration: none; color: white; ">
                            <div class="p-3" style="background-color: #ff7f27; height: 20em; width: 12em; border-radius: 15px;">
                                <p style="
                        font-weight: bolder; font-size: 2rem;"> Game</p>
                                <div class="box-border">
                                    <div class="box-content"></div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col">
                        <a href="./videoLesson?lesson_id=${requestScope.lesson.lesson_id}" style="text-decoration: none; color: white; ">
                            <div class="p-3" style="background-color: #00b050; height: 20em; width: 12em; border-radius: 15px;">
                                <p style="
                        font-weight: bolder; font-size: 2rem;"> Video</p>
                                <div class="box-border">
                                    <div class="box-content"></div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col">
                        <a href="./contentLesson?lesson_id=${requestScope.lesson.lesson_id}" style="text-decoration: none; color: white; ">
                            <div class="p-3" style="background-color: #0081e2; height: 20em; width: 12em;border-radius: 15px;">
                                <p style="
                        font-weight: bolder; font-size: 2rem;"> Lý thuyết</p>
                                <div class="box-border">
                                    <div class="box-content"></div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col">
                        <a href="" style="text-decoration: none; color: white; ">
                            <div class="p-3" style="background-color: #ec31ef; height: 20em; width: 12em;border-radius: 15px;">
                                <p style="
                        font-weight: bolder; font-size: 2rem;"> Xếp Hạng</p>
                                <div class="box-border">
                                    <div class="box-content"></div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>

</html>


