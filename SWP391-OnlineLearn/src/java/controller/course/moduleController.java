/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.course;

import controller.auth.BaseAuthenticationController;
import dal.LessonDBContext;
import dal.ModuleDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Lesson;
import model.Module;

/**
 *
 * @author Khangnekk
 */
public class moduleController extends BaseAuthenticationController {


    protected void doPostProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }


    protected void doGetProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    protected boolean processModuleStatus(ArrayList<Lesson> lessons) {
        int item = 0;
        for (Lesson l : lessons) {
            if (l.isStatus()) {
                item++;
            }
        }
        return item == lessons.size();
    }
    
    protected double getPercentLesson(ArrayList<Module> modules) {
        double percent;
        double learnStatusTrue = 0,
                learnStatusFalse = 0,
                numberOfLessons = modules.size();
        
        for (Module l : modules) {
            if (l.isStatus()) {
                learnStatusTrue++;
            } else {
                learnStatusFalse++;
            }
        }
        percent = (learnStatusTrue * 100) / numberOfLessons;
        return Math.round(percent * 100.0) / 100.0;
    }

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
                int module_id = Integer.parseInt(req.getParameter("module_id"));

        ModuleDBContext mDB = new ModuleDBContext();
        LessonDBContext lDB = new LessonDBContext();
        ArrayList<Lesson> lessons = lDB.listLessonByModuleID(module_id);
        Module module = mDB.get(module_id);
        req.setAttribute("module", module);
        req.setAttribute("lessons", lessons);

        // load percent using db
        lessonController lCtr = new lessonController();
        double percent = lCtr.getPercentLesson(lessons);
        req.setAttribute("percent", percent);
        
        req.getRequestDispatcher("./module.jsp").forward(req, resp);
    }
}
