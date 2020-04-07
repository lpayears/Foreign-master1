package com.lpa.service;

import com.lpa.entity.Client;
import com.lpa.utils.Response;

import java.util.List;
import java.util.Map;

public interface ClientService {
    Client getClientById(int id);

    void addClient(Client client);

    Response delClient(int id);

    boolean updateClient(Client client);

    List<Client> getAllClient();

    List<Client> getClientList(Integer pn, Map<String, Long> map, Client client);
}
