package com.lpa.dao;

import com.lpa.entity.Project;
import com.lpa.utils.MyPo;

import java.util.List;
import java.util.Map;

public interface ProjectDao {

    public Project getProjectById(int id);

    public void addProject(Project project);

    public boolean updateProject(Project project);

    public boolean updateCheck(Project project);

    public boolean delProject(int id);

    public List<Project> getAllProject();

    List<Project> getProjectList(Integer pn, Map<String, Long> map, MyPo po);

    Project getMaxProject();
}
