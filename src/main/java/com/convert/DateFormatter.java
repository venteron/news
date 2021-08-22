package com.convert;

import org.springframework.format.Formatter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class DateFormatter implements Formatter<Date> {

    private SimpleDateFormat sdf;

    public SimpleDateFormat getSdf() {
        return sdf;
    }

    public void setSdf(SimpleDateFormat sdf) {
        this.sdf = sdf;
    }

    @Override
    public Date parse(String s, Locale locale) throws ParseException {
        return sdf.parse(s);
    }

    @Override
    public String print(Date date, Locale locale) {
        return sdf.format(date);
    }
}
