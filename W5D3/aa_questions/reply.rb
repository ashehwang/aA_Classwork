require_relative "questions_database"

class Reply

    attr_accessor :question_id, :parent_reply_id, :author_id, :body
    attr_reader :id

    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                replies
            WHERE
                replies.id = ?
        SQL
        Reply.new(data.first)
    end

    def self.find_by_author_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                replies
            WHERE
                replies.author_id = ?
        SQL
        data.map { |datum| Reply.new(datum) }
    end

    def self.find_by_question_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                replies
            WHERE
                replies.question_id = ?
        SQL
        data.map { |datum| Reply.new(datum) }
    end

    def initialize(options)
        @id = options['id'] #??? " or ' ?
        @question_id = options['question_id']
        @parent_reply_id = options['parent_reply_id']
        @author_id = options['author_id']
        @body = options['body']
    end

    def save
        if self.id
            QuestionsDatabase.instance.execute(<<-SQL, self.question_id, self.parent_reply_id, self.author_id, self.body, self.id)
                UPDATE 
                    replies
                SET 
                    question_id = ?,
                    parent_reply_id = ?,
                    author_id = ?,
                    body = ?
                WHERE
                    replies.id = ?
            SQL
        else
            QuestionsDatabase.instance.execute(<<-SQL, self.question_id, self.parent_reply_id, self.author_id, self.body)
                INSERT INTO
                    replies(question_id, parent_reply_id, author_id, body)
                VALUES
                    (?, ?, ?, ?)
            SQL

            self.id = QuestionsDatabase.instance.last_insert_row_id
        end
    end

    def author
        User.find_by_id(self.author_id)
    end

    def question
        Question.find_by_id(self.question_id)
    end

    def parent_reply
        return nil unless self.parent_reply_id
        Reply.find_by_id(self.parent_reply_id)
    end

    def child_replies
        data = QuestionsDatabase.instance.execute(<<-SQL, self.id)
        SELECT
            *
        FROM
            replies
        WHERE
            replies.parent_reply_id = ?
        SQL
        data.map { |datum| Reply.new(datum)}
    end

    private
    attr_writer :id
end