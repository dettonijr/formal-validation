% BASIC PROTOCOL %

fof(a_holds_a_key_with_t, axiom, (
    ak(key(at,t))    
)).

fof(a_is_a_party_in_the_protocol, axiom, (
    party(a)
)).

fof(step_one, axiom, (
    sent(a,b,pair(a,na)) & sa(pair(b,na))
)).

fof(b_holds_a_key_with_t, axiom, (
    bk(key(bt,t))
)).

fof(b_is_a_party_in_the_protocol, axiom, (
    party(b)
)).

fof(na_is_fresh_to_b, axiom, (
    bf(na)
)).

fof(second_step, axiom, ( ![XA,XNA] : (
    (sent(XA, b, pair(XA,XNA)) & bf(XNA))
    => 
    (sb(pair(XA,XNA)) & sent(b,t,triple(b,nb(XNA),encr(triple(XA,XNA,tb(XNA)),bt))))   
))).

fof(t_holds_keys_with_a_and_b, axiom, (
    tk(key(at,a)) & tk(key(bt,b))
)).

fof(t_is_a_party_in_the_protocol, axiom, (
    party(t)
)).

fof(third_step, axiom, ( ![XB,XNB,XA,XNA,XBET,XBT,XAT,XK] : (
    (sent(XB,t,triple(XB,XNB,encr(triple(XA,XNA,XBET),XBT))) &
    tk(key(XBT,XB)) & tk(key(XAT,XA)) & nonce(XNA))
    =>
    sent(t,XA,triple(encr(quadr(XB,XNA,kt(XNA),XBET),XAT),encr(triple(XA,kt(XNA),XBET),XBT),XNB))    
))).

fof(fourth_step, axiom, (
    ![XA,XNA,XK,XBET,XB,XM,XNB] : (
    (sent(t,a,triple(encr(quadr(XB,XNA,XK,XBET),at),XM,XNB)) & sa(pair(XB,XNA)))
    =>
    (sent(a,XB,pair(XM,encr(XNB,XK))) & ak(key(XK,XB)))
    )
)).

fof(b_receives_the_last_message_and_decrypt, axiom, (
    ![XA,XK,XNA] : (
    (sent(XA,b,pair(encr(triple(XA,XK,tb(XNA)),bt),encr(nb(XNA),XK))) & sb(pair(XA,XNA)))
    =>
    bk(key(XK,XA))
    )
)).

% Attacker %

fof(the_attacker_can_store_all_messages, axiom, (
    ![XA,XB,XM] : (
    sent(XA, XB, XM) => im(XM)
    )
)).

% Attacker can compose and decompose messages
fof(decompose_pair, axiom, (
    ![U,V] : (
    im(pair(U,V)) => (im(U) & im(V))
    )
)).
fof(decompose_triple, axiom, (
    ![U,V,W] : (
    im(triple(U,V,W)) => (im(U) & im(V) & im(W))
    )
)).
fof(decompose_quadr, axiom, (
    ![U,V,W,Z] : (
    im(quadr(U,V,W,Z)) => (im(U) & im(V) & im(W) & im(Z))
    )
)).
fof(compose_pair, axiom, (
    ![U,V] : (
    (im(U) & im(V)) => im(pair(U,V))
    )
)).
fof(compose_triple, axiom, (
    ![U,V,W] : (
    (im(U) & im(V) & im(W)) => im(triple(U,V,W))
    )
)).
fof(compose_quadr, axiom, (
    ![U,V,W,Z] : (
    (im(U) & im(V) & im(W) & im(Z)) => im(quadr(U,V,W,Z))
    )
)).

fof(the_attacker_can_impersonate_any_party, axiom, (
    ![X,Y,U] : (
    (party(X) & party(Y) & im(U)) => sent(X,Y,U)
    )
)).

fof(any_information_can_be_a_key_for_the_attacker, axiom, (
    ![V,W] : (
    (im(V) & party(W)) => ik(key(V,W))
    )
)).

fof(the_attacker_can_encrypt, axiom, (
    ![U,V,W] : (
    (im(U) & ik(key(V,W)) & party(W)) => im(encr(U,V))
    )
)).

fof(na_is_a_nonce, axiom, (
    nonce(na)
)).

fof(keys_cant_be_used_as_nonces, axiom, ( ![X] : (
    ~nonce(kt(X))   
))).

%fof(key_exchange, conjecture, (
%    ?[X] : (ak(key(X,b)) & bk(key(X,a)))
%)).


%fof(attacker_has_key, conjecture, (
%     ?[X] : (ik(key(X,b)) & bk(key(X,a)))
%)).














