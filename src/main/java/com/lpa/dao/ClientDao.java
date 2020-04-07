package com.lpa.dao;

import com.lpa.entity.Client;

import java.util.List;
import java.util.Map;

public interface ClientDao {

    public Client getClientById(int id);

    public void addClient(Client client);

    public boolean delClient(int id);

    public boolean updateClient(Client client);

    public List<Client>  getAllClient();

    List<Client> getClientList(Integer pn, Map<String, Long> map, Client client);
}
