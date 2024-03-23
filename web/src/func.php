<?php
    function db() {
        return new PDO("mysql:host=localhost;dbname=timecode", "root", "");
    }

    function check_pr($pr_name){
        $conn = db();
        try{
            $res = $conn->query("SELECT * FROM projects WHERE name = '$pr_name'");
        }catch(Exception $e){
            die("check_pr");
        }
        if(mysqli_num_rows($res) > 0){ // TODO non so se conviene usare count(*)
            $row = $res->fetch_assoc(); // TODO pls usa pdo che non ha problemi di versione a differenza di mysqli
            return $row['id_project'];
        }
        return -1;
    }

    function insert($id_user, $unix_start, $unix_end, $pr_name, $files_name, $os){
        $id_project = check_pr($pr_name);
        if($id_project == -1)
            $id_project = project($pr_name);
        $date = date("d-m-Y", $unix_start);
        $start = date("Y-m-d H:i:s", $unix_start);
        $end = date("Y-m-d H:i:s", $unix_end);

        activity($id_user, $id_project, $date, $start, $end);
        activity_language();
    }

    // insert a new project in the database
    function project($pr_name){
        $conn = db();
        try{
            $conn->query("INSERT INTO projects VALUES(NULL, '$pr_name')");
            return $conn->insert_id;
        }catch(Exception $e){ die("project"); }
    }

    // insert a new activity in the database
    function activity($id_user, $id_project, $date, $start, $end){
        $conn = db();
        try{
            $conn->quesry("INSERT INTO activities VALUES(NULL, $date, TIMEDIFF($end, $start), $id_user, $id_project)");
        }catch(Exception $e){ die("activity"); }
    }

    function activity_language($id_activity, $files_name){

    }
?>
