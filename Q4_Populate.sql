---This script contains statements for inserting data into the different tables

---County table Values
Insert into county values('EX', 'ESSEX');
Insert into county values('LD', 'LONDON');
Insert into county values('BH', 'BIRMINGHAM');
Insert into county values('ES', 'EAST SUFFOLK');
Insert into county values('GL', 'GREATER LONDON');
Insert into county values('AV', 'AVON');


--Office table values
Insert into office values(office_no_seq.nextval, 'UNIT 5, GROVELANDS BUSINESS CENTRE, ESSEX, SS14 1LE', '01268 551423', '01268 551424', 'EX'); 
Insert into office values(office_no_seq.nextval, '2 LISBON ROAD, CAMDEN, LONDON, NW1 1LA', '0207 5584 393',null,'LD');
Insert into office values(office_no_seq.nextval, '8 FRIEDMAN WAY, ALDGATE, LONDON, EC3N 1AH', '0207 5114 157', '0207 5114 158', 'LD');
Insert into office values(office_no_seq.nextval, '15 LOCKE ROAD, FINSBURY SQUARE, LONDON, EC2Q 1LH', '0207 5334 157',null, 'LD');
Insert into office values(office_no_seq.nextval, '3 BARNES STREET, EDGBASTON, BIRMINGHAM, B1 1BB', '0121 303 1231',null, 'BH');
Insert into office values(office_no_seq.nextval, '12, DYKE ROAD KINGSWOOD, AVON, BS14 2NA', '0117 966 1234','0117 966 1235', 'AV');


--Staff table values
Insert into staff values(staff_no_seq.nextval, 'BRIAN', 'BADONDE', '2 FISHER CLOSE, PITSEA, ESSEX, SS14 2RA', '07785894814', 'M', 'A+', 110);

Insert into staff values(staff_no_seq.nextval, 'CHLOE', 'JAMES', '2 SAVOY ROAD, KNIGHTSBRIDGE, SW7 1RA', '07585695822', 'F', 'AA', 120);

Insert into staff (s_no, f_name, l_name, s_addr, s_telno, gender,office_no)
values(staff_no_seq.nextval, 'SANJAY', 'PATEL', '2 MARTIN CLOSE, CANNING TOWN, E16 1LH', '07839044721', 'M',130);

Insert into staff (s_no, f_name, l_name, s_addr, gender,grade,office_no)
values(staff_no_seq.nextval,'JAMES','BOND', '56 DARLINGTON ROAD, EDGBASTON, B1 2EB','M',null,150);

Insert into staff (s_no, f_name, l_name, s_addr,s_telno, gender,grade,office_no)
values(staff_no_seq.nextval,'SUE','CHAN', '56 TYSON ROAD, WEST HAM, E15 1GA','07453104999','F','BB',130);

Insert into staff (s_no, f_name, l_name, s_addr,s_telno, gender,grade,office_no)
values(staff_no_seq.nextval,'BEN','HAYES', '25 BERRY ROAD, KINGSWOOD, BS14 1FA','07846631118','M','C+',160);

Insert into staff (s_no, f_name, l_name, s_addr,s_telno, gender, grade, office_no)
values(staff_no_seq.nextval,'HAJERA','AHMED', '75 SCHOLES ROAD, BRENTWOOD, ESSEX, CM13 1AB',null,'F','AB',110);

Insert into staff (s_no, f_name, l_name, s_addr,s_telno, gender, grade, office_no)
values(staff_no_seq.nextval,'VIKTOR','BENKOWSKI', '4 ARTHUR ROAD, EDGBASTON, BIRMINGHAM, B5 7QU','01215094367','M','B+',150);


--Project table values
Insert into project(pr_no, pr_desc, pr_st_dt, pr_exp_compl_dt, pr_act_compl_dt,pr_stage,pr_status, s_no)
values('BK435','DESIGNING AND BUILDING', to_date('20-APR-14','dd-mm-yy'),to_date('30-JUN-14','dd-mm-yy'),to_date('30-JUN-14','dd-mm-yy'),'OTHER','COMPLETED',1045);

Insert into project(pr_no, pr_desc, pr_st_dt, pr_exp_compl_dt, pr_act_compl_dt,pr_stage,pr_status, s_no)
values('BK400','BUYING MATERIALS AND LABOUR', to_date('02-JUL-14','dd-mm-yy'),to_date('31-JUL-15','dd-mm-yy'),null,'OTHER','ONGOING',1050);

Insert into project(pr_no, pr_desc, pr_st_dt, pr_exp_compl_dt, pr_act_compl_dt,pr_stage,pr_status, s_no)
values('AA450','LEVELLING THE LAND', to_date('30-JUL-14','dd-mm-yy'),to_date('10-AUG-14','dd-mm-yy'),to_date('20-AUG-14','dd-mm-yy'),'FOUNDATIONS','COMPLETED',1070);

Insert into project(pr_no, pr_desc, pr_st_dt, pr_exp_compl_dt, pr_act_compl_dt,pr_stage,pr_status, s_no)
values('BK345','LAYING FOUNDATION', to_date('25-SEP-14','dd-mm-yy'),to_date('31-OCT-14','dd-mm-yy'),to_date('06-DEC-14','dd-mm-yy'),'FOUNDATIONS','COMPLETED',1050);

Insert into project(pr_no, pr_desc, pr_st_dt, pr_exp_compl_dt, pr_act_compl_dt,pr_stage,pr_status, s_no)
values('AB200','INSTALLING UTILITY PIPES', to_date('22-AUG-14','dd-mm-yy'),to_date('30-AUG-14','dd-mm-yy'),to_date('20-SEP-14','dd-mm-yy'),'OTHER','COMPLETED',1060);

Insert into project(pr_no, pr_desc, pr_st_dt, pr_exp_compl_dt, pr_act_compl_dt,pr_stage,pr_status, s_no)
values('EE210','ERECTING FRAME', to_date('15-DEC-14','dd-mm-yy'),to_date('30-APR-15','dd-mm-yy'),to_date('05-MAY-15','dd-mm-yy'),'FRAME','COMPLETED',1050);

Insert into project(pr_no, pr_desc, pr_st_dt, pr_exp_compl_dt, pr_act_compl_dt,pr_stage,pr_status, s_no)
values('DA110','ROOFING', to_date('15-MAY-15','dd-mm-yy'),to_date('30-JUN-15','dd-mm-yy'),to_date('20-JUL-15','dd-mm-yy'),'OTHER','COMPLETED',1070);

Insert into project(pr_no, pr_desc, pr_st_dt, pr_exp_compl_dt, pr_act_compl_dt,pr_stage,pr_status, s_no)
values('CC160','PLUMBING WORK', to_date('23-JUL-15','dd-mm-yy'),to_date('15-AUG-15','dd-mm-yy'),to_date('03-SEP-15','dd-mm-yy'),'PLUMBING','COMPLETED',1055);

Insert into project(pr_no, pr_desc, pr_st_dt, pr_exp_compl_dt, pr_act_compl_dt,pr_stage,pr_status, s_no)
values('AF510','WIRING', to_date('20-AUG-15','dd-mm-yy'),to_date('15-SEP-15','dd-mm-yy'),to_date('10-OCT-15','dd-mm-yy'),'ELECTRICAL','COMPLETED',1070);

Insert into project(pr_no, pr_desc, pr_st_dt, pr_exp_compl_dt, pr_act_compl_dt,pr_stage,pr_status, s_no)
values('UA720','INSULATION', to_date('13-OCT-15','dd-mm-yy'),to_date('30-OCT-15','dd-mm-yy'),to_date('01-NOV-15','dd-mm-yy'),null,'COMPLETED',1060);

Insert into project(pr_no, pr_desc, pr_st_dt, pr_exp_compl_dt, pr_act_compl_dt,pr_stage,pr_status, s_no)
values('AG600','CEILING', to_date('05-NOV-15','dd-mm-yy'),to_date('25-NOV-15','dd-mm-yy'),to_date('22-NOV-15','dd-mm-yy'),'OTHER','COMPLETED',1060);

Insert into project(pr_no, pr_desc, pr_st_dt, pr_exp_compl_dt, pr_act_compl_dt,pr_stage,pr_status, s_no)
values('BD620','INSTALLING PLUMBING', to_date('25-NOV-15','dd-mm-yy'),to_date('08-DEC-15','dd-mm-yy'),null,'PLUMBING','ONGOING',1055);

Insert into project(pr_no, pr_desc, pr_st_dt, pr_exp_compl_dt, pr_act_compl_dt,pr_stage,pr_status, s_no)
values('BD621','FIXING WALLS', null,null,null,'DECORATION','PLANNING',1075);

Insert into project(pr_no, pr_desc, pr_st_dt, pr_exp_compl_dt, pr_act_compl_dt,pr_stage,pr_status, s_no)
values('BD622','INSTALLING FIXTURES', null,null,null,'DECORATION','PLANNING',1065);

Insert into project(pr_no, pr_desc, pr_st_dt, pr_exp_compl_dt, pr_act_compl_dt,pr_stage,pr_status, s_no)
values('BD623','LAYING FLOOR', null,null,null,'DECORATION','PLANNING',1065);

Insert into project(pr_no, pr_desc, pr_st_dt, pr_exp_compl_dt, pr_act_compl_dt,pr_stage,pr_status, s_no)
values('BK436','LANDSCAPE GARDENING', null,null,null,'OTHER','PLANNING',1075);

Insert into project(pr_no, pr_desc, pr_st_dt, pr_exp_compl_dt, pr_act_compl_dt,pr_stage,pr_status, s_no)
values('BK346','SNAGGING', null,null,null,'OTHER','PLANNING',1050);


--Purchase_Order table values

Insert into purchase_order(pr_no, po_no, po_date) values('BK345', 1, to_date('30-SEP-14','dd-mm-yy'));
Insert into purchase_order(pr_no, po_no, po_date) values('BK345', 2, to_date('24-SEP-14','dd-mm-yy'));
Insert into purchase_order(pr_no, po_no, po_date) values('BK435', 0, null);
Insert into purchase_order(pr_no, po_no, po_date) values('BK400', 2, to_date('03-JUL-14','dd-mm-yy'));
Insert into purchase_order(pr_no, po_no, po_date) values('BK400', 3, to_date('05-JUL-14','dd-mm-yy'));
Insert into purchase_order(pr_no, po_no, po_date) values('BK400', 4, to_date('08-AUG-14','dd-mm-yy'));
Insert into purchase_order(pr_no, po_no, po_date) values('AA450',0,null);
Insert into purchase_order(pr_no, po_no, po_date) values('AB200',1, to_date('17-AUG-14','dd-mm-yy'));
Insert into purchase_order(pr_no, po_no, po_date) values('EE210',2, to_date('03-JAN-15','dd-mm-yy'));
Insert into purchase_order(pr_no, po_no, po_date) values('DA110',1, to_date('24-MAY-15','dd-mm-yy'));
Insert into purchase_order(pr_no, po_no, po_date) values('CC160',2, to_date('20-JUL-15','dd-mm-yy'));
Insert into purchase_order(pr_no, po_no, po_date) values('AF510',2, to_date('15-AUG-15','dd-mm-yy'));
Insert into purchase_order(pr_no, po_no, po_date) values('UA720',1, to_date('08-OCT-15','dd-mm-yy'));
Insert into purchase_order(pr_no, po_no, po_date) values('AG600',1, to_date('12-NOV-15','dd-mm-yy'));
Insert into purchase_order(pr_no, po_no, po_date) values('BD621',1, to_date('26-NOV-15','dd-mm-yy'));
Insert into purchase_order(pr_no, po_no, po_date) values('BD620',2, to_date('22-NOV-15','dd-mm-yy'));


--Item Values
Insert into item(it_no, it_desc) values(item_no_seq.nextval, 'CONCRETE FOR FOUNDATION');
Insert into item(it_no, it_desc) values(item_no_seq.nextval, 'METAL FOR FOUNDATION');
Insert into item(it_no, it_desc) values(item_no_seq.nextval, 'WOOD FOR FOUNDATION');
Insert into item(it_no, it_desc) values(item_no_seq.nextval, 'CONCRETE FOR GENERAL BUILDING');
Insert into item(it_no, it_desc) values(item_no_seq.nextval, 'ROOF TILES');
Insert into item(it_no, it_desc) values(item_no_seq.nextval, 'RECRUITERS COST');
Insert into item(it_no, it_desc) values(item_no_seq.nextval, 'GENERAL CONSTRUCTION METALS');
Insert into item(it_no, it_desc) values(item_no_seq.nextval, 'COMPOSITE MATERIALS');
Insert into item(it_no, it_desc) values(item_no_seq.nextval, 'PARTITIONING MATERIALS');
Insert into item(it_no, it_desc) values(item_no_seq.nextval, 'TRUSS PACKAGE');
Insert into item(it_no, it_desc) values(item_no_seq.nextval, 'WINDOWS');
Insert into item(it_no, it_desc) values(item_no_seq.nextval, 'INSULATION MATERIALS');
Insert into item(it_no, it_desc) values(item_no_seq.nextval, 'FURNITURE');
Insert into item(it_no, it_desc) values(item_no_seq.nextval, 'FLOORBOARDS');
Insert into item(it_no, it_desc) values(item_no_seq.nextval, 'BOILERS');
Insert into item(it_no, it_desc) values(item_no_seq.nextval, 'BATHTUBS AND TOILETS');
Insert into item(it_no, it_desc) values(item_no_seq.nextval, 'PAINT');
Insert into item(it_no, it_desc) values(item_no_seq.nextval, 'SOCKETS, SWITCHES');



--PO_ITEM VALUES
Insert into po_item(pr_no, po_no, it_no, qty, price) values('BK400', 4, 11500, 12,350.00);
Insert into po_item(pr_no, po_no, it_no, qty, price) values('BK400', 3, 10400, 100,4.00);
Insert into po_item(pr_no, po_no, it_no, qty, price) values('BK400', 2,10700, 50,45.00);
Insert into po_item(pr_no, po_no, it_no, qty, price) values('BK400', 4,10600, 15,200.00);
Insert into po_item(pr_no, po_no, it_no, qty, price) values('BK345', 1,10000, 120,4.00);
Insert into po_item(pr_no, po_no, it_no, qty, price) values('BK345', 2,10100, 100,45.00);
Insert into po_item(pr_no, po_no, it_no, qty, price) values('AF510', 2,11800, 300,2.00);
Insert into po_item(pr_no, po_no, it_no, qty, price) values('UA720', 1,11200, 200,10.00);
Insert into po_item(pr_no, po_no, it_no, qty, price) values('BD620',2,11600,20,65.00);
Insert into po_item(pr_no, po_no, it_no, qty, price) values('DA110',1,10500,10000,0.94);

