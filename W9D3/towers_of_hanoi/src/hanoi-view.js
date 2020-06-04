
class View {

    constructor(game, rootEl) {
        this.game = game;
        this.rootEl = rootEl;

        this.setupTowers();
        this.render();
    }

    setupTowers(){
        for (let i = 0; i < 3; i++ ){
            const $ul = $('<ul>');
            $ul.data('towerIndex', i);
            for (let j = 0; j < 3; j++ ) {
                const $li = $('<li>');
                $ul.append($li);
            }
            this.rootEl.append($ul);
        }
    }

    render() {
        const $towers = this.rootEl.find('ul');
        const $disks = $towers.find('li');
    
        const firstTower = $towers.first();

        firstTower.children().each((idx, ele) => {
            // debugger
            $(ele).addClass(`disk-${idx}`);
        });
        //find ul with towerIndex of 0
        //find all the li of that tower
        //for each li give classname of 'disk-1/2/3'
    }
}

module.exports = View;