require_relative "questions_database"

class User

    attr_accessor :fname, :lname
    attr_reader :id

    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                users
            WHERE
                users.id = ?
        SQL
        User.new(data.first)
    end

    def self.find_by_name(fname, lname)
        data = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
            SELECT
                *
            FROM
                users
            WHERE
                users.fname = ? AND
                users.lname = ?
        SQL
        data.map { |datum| User.new(datum) }
    end

    def initialize(options)
        @id = options['id'] #??? " or ' ?
        @fname = options['fname']
        @lname = options['lname']
    end

    def save
        if self.id
            QuestionsDatabase.instance.execute(<<-SQL, self.fname, self.lname, self.id)
                UPDATE 
                    users
                SET 
                    fname = ?,
                    lname = ?
                WHERE
                    users.id = ?
            SQL
        else
            QuestionsDatabase.instance.execute(<<-SQL, self.fname, self.lname)
                INSERT INTO
                    users(fname, lname)
                VALUES
                    (?, ?)
            SQL

            self.id = QuestionsDatabase.instance.last_insert_row_id
        end
    end

    def authored_questions
        Question.find_by_questioner_id(self.id)
    end

    def authored_replies
        Reply.find_by_author_id(self.id)
    end

    def followed_questions
        QuestionFollow.followed_questions_for_user_id(self.id)
    end

    def liked_questions
        QuestionLike.liked_questions_for_user_id(self.id)
    end

    def average_karma
        num = QuestionsDatabase.instance.execute(<<-SQL, self.id)
        SELECT
        (CAST(COUNT(question_likes.id) AS FLOAT) / COUNT(DISTINCT questions.id)) AS average
        FROM
            questions
        LEFT OUTER JOIN
            question_likes
        ON
            questions.id = question_likes.question_id
        WHERE
            questions.questioner_id = ? ;
        SQL
        num.first["average"]
    end

    private
    attr_writer :id
end