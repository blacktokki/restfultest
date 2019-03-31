package com.example.restfultest.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Data
@Entity
public class Demo {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)//SEQUENCE
    private int idx;

    @Column(length = 20, nullable = false)
    private String name;

    @Column(length = 20, nullable = false)
    private String password;

    @Builder
    public Demo(String name, String password) {
        this.name = name;
        this.password = password;
    }
}
