class PrettyscoreTagLib {
    //
    // <g:prettyScore score="1"  format="letter | numeric" />
    //
    def prettyScore = {attrs, body ->
        def score = attrs.score.intValue()
        switch (attrs.format) {
            case 'letter':
                out << "<span class='lettergrade''>${toLetterGrade(score)}</span>"
                break
            case 'numeric':
                out << "<span class='score' style='color:${toColorGrade(score)}'>${score}</span>"
                break
            default:
                out << "<span class='score'>${score}</span>"
        }

    }

    def String toLetterGrade(Integer score) {
        def grade = ''
        switch (score) {
            case 95..100:
                grade = 'A'
                break
            case 90..95:
                grade = 'A-'
                break
            case 85..90:
                grade = 'B+'
                break
            case 80..85:
                grade = 'B-'
                break
            case 75..80:
                grade = 'C+'
                break
            case 70..75:
                grade = 'C'
                break
            case 65..75:
                grade = 'C-'
                break
            case 60..65:
                grade = 'D+'
                break
            case 55..60:
                grade = 'D-'
                break
            case 50..55:
                grade = 'F+'
                break
            case 0..50:
                grade = 'F'
                break
        }
        return grade
    }

    def String toColorGrade(Integer score) {
        def color = 'black'
        switch (score) {
            case 95..100:
                color = 'Blue'
                break
            case 90..95:
                color = 'DarkBlue'
                break
            case 85..90:
                color = 'Green'
                break
            case 80..85:
                color = 'Green'
                break
            case 75..80:
                color = 'Green'
                break
            case 70..75:
                color = 'Green'
                break
            case 65..75:
                color = 'OrangeRed'
                break
            case 60..65:
                color = 'OrangeRed'
                break
            case 55..60:
                color = 'DarkRed'
                break
            case 50..55:
                color = 'DarkRed'
                break
            case 0..50:
                color = 'Red'
                break
        }
        return color
    }
}
