use Financial;

CREATE TABLE transactions_data(
    id BIGINT,
    date VARCHAR(MAX),
    client_id BIGINT,
    card_id BIGINT,
    amount VARCHAR(MAX),
    use_chip VARCHAR(MAX),
    merchant_id VARCHAR(MAX),
    merchant_city VARCHAR(MAX),
    merchant_state VARCHAR(MAX),
    zip VARCHAR(MAX),
    mcc VARCHAR(MAX),
    errors VARCHAR(MAX)
);
--DROP TABLE transactions_data;
BULK INSERT transactions_data
    FROM 'D:\Training_instant\Notebook\Excel\transactions_data.csv'
    WITH (
	    FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
		MAXERRORS = 1000
    );


SELECT *
From Cards_cleaning as c 
join User_cleaned as u on c.client_id = u.id
join transactions_data as t on t.card_id = c.id;