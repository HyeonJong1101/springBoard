package aisw.web.board;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class BoardRowMapper implements RowMapper<BoardVO> {

    @Override
    public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
        BoardVO board = new BoardVO();
        board.setBoardID(rs.getInt("boardid"));
        board.setWriter(rs.getString("memberid"));
        board.setTitle(rs.getString("title"));
        board.setContent(rs.getString("content"));
        board.setRegDate(rs.getDate("regdate"));
        return board;
    }
}
