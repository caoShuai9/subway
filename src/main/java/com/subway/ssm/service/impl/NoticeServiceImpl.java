package com.subway.ssm.service.impl;

import com.subway.ssm.entity.Notice;
import com.subway.ssm.mapper.NoticeMapper;
import com.subway.ssm.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author liuyanzhao
 */
@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public List<Notice> listNotice(Integer status)  {
        return noticeMapper.listNotice(status);
    }

    @Override
    public void insertNotice(Notice notice)  {
        noticeMapper.insert(notice);
    }

    @Override
    public void deleteNotice(Integer id)  {
        noticeMapper.deleteById(id);
    }

    @Override
    public void updateNotice(Notice notice)  {
        noticeMapper.update(notice);
    }

    @Override
    public Notice getNoticeById(Integer id)  {
        return noticeMapper.getNoticeById(id);
    }

}
