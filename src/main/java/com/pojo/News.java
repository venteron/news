package com.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class News {
    private int nid;
    private String title;
    private String content;
    private Date date;
    private String video;
    private String photo;
    private int visit;
    private int status;
}
