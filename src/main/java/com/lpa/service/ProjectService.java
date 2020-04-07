package com.lpa.service;;

import com.lpa.entity.Project;
import com.lpa.utils.MyPo;
import com.lpa.utils.Response;

import java.util.List;
import java.util.Map;

public interface ProjectService {
    Project getProjectById(int id);

    void addProject(Project project);

    boolean updateProject(Project project);

    boolean updateCheck(Project project);

    Response delProject(int id);

    List<Project> getAllProject();

    List<Project> getProjectList(Integer pn, Map<String, Long> map, MyPo po);

    public List<List<String>> exportProject(List<Project> projects);
}
