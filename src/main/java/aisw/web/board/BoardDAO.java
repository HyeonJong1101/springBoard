package aisw.web.board;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
    private static final int LIST_SIZE = 5;
    private static final String BOARD_LIST_PAGE = "SELECT boardid, title, memberid, regdate, content " +
            "FROM (SELECT ROWNUM rnum, b.* " +
            "      FROM (SELECT a.* " +
            "            FROM b_board a " +
            "            ORDER BY boardid DESC) b) " +
            "WHERE rnum >= ? " +
            "AND rnum <= ?";

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public List<BoardVO> search(int pageNo) {
        int start = (pageNo - 1) * LIST_SIZE + 1;
        int end = pageNo * LIST_SIZE;

        String query = BOARD_LIST_PAGE;
        List<BoardVO> boardList = jdbcTemplate.query(query, new Object[]{start, end}, new BoardRowMapper());
        return boardList;
    }

	
}
