package com.oracle.shubook.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
import javax.validation.constraints.Size;

public class Admin {
    private int id;
    @NotNull
    @Size(min = 3,max = 16)
    private String name;
    @NotNull
    @Size(min = 3,max = 16)
    private String pwd;
    public Admin(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
}
