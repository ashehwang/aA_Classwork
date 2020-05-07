require_relative "questions_database"

class QuestionLike

    attr_accessor :question_id, :user_id
    attr_reader :id

    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                question_likes
            WHERE
                question_likes.id = ?
        SQL
        QuestionLike.new(data.first)
    end

    def self.likers_for_question_id(question_id)
        users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                users.*
            FROM
                users
            JOIN
                question_likes
            ON
                users.id = question_likes.user_id
            WHERE
                question_likes.question_id = ?;
        SQL
        users.map {|user| User.new(user)}
    end

    def self.num_likes_for_question_id(question_id)
        num_likes = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                COUNT(*)
            FROM
                users
            JOIN
                question_likes
            ON
                users.id = question_likes.user_id
            WHERE
                question_likes.question_id = ?;
        SQL
        num_likes.first["COUNT(*)"]
    end

    def self.liked_questions_for_user_id(user_id)
        questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT
                questions.*
            FROM
                questions
            JOIN
                question_likes
            ON
                questions.id = question_likes.question_id
            WHERE
                question_likes.user_id = ?;
        SQL
        questions.map {|question| Question.new(question)}
    end

    def self.most_liked_questions(n)
        questions = QuestionsDatabase.instance.execute(<<-SQL, n)
            SELECT
                questions.*
            FROM
                questions
            LEFT JOIN
                question_likes
            ON
                questions.id = question_likes.question_id
            GROUP BY
                questions.id 
            ORDER BY
                CASE 
                    WHEN question_likes.question_id IS NULL
                    THEN 0
                    ELSE
                        COUNT(*)
                END DESC
            LIMIT ?
        SQL
        questions.map { |question| Question.new(question) }
    end
    

    def initialize(options)
        @id = options['id'] #??? " or ' ?
        @question_id = options['question_id']
        @user_id = options['user_id']
    end

    private
    attr_writer :id
end