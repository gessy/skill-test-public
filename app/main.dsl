import "commonReactions/all.dsl";
import "confirmIntent.dsl";


context {
    input phone: string;
    desired_weekday: string = "";
}

external function updateIntents(intent: string, text: string?, confirmed: boolean): unknown;



start node root_no_loop {
    do {
        #connectSafe($phone);
        #waitForSpeech(1000);
        #sayText("Welcome to 12 Stories shop! How can I help you?");
        wait *;
    }
}



digression just_true {
    conditions { on true; }
    do {

        if ( #messageHasAnyIntent(["seek_by_size", "category_jeans"]) ) {
            #sayText("[catch] seek_by_size or category_jeans");
        }

        if ( #messageHasIntent("seek_by_size") ) {
            #sayText("[catch] seek_by_size");
        }

        if ( #messageHasIntent("category_jeans") ) {
            #sayText("[catch] category_jeans");
        }

        #sayText("------------------------------------------------------");
        return;
    }
}


digression close {
    conditions { on true tags: onclosed; }
    do {
        exit;
    }
}

